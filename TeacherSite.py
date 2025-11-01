#!/usr/bin/env python

#-------------------------------------------------------------------
# run.py
# Author: Kevin Kim
#-------------------------------------------------------------------

import flask
import urllib
from flask_cors import CORS
import sys
import io
import base64
#import database
#import auth

import subprocess, tempfile, os
import ast # for block security
# ------------------ Local imports ------------------
from BlockSecurity import validate_ast

# -------------------------------------------------------------------

app = flask.Flask(__name__, template_folder='static/templates', static_folder='static')
CORS(app)#, resources={r"/plt-blocks/*": {"origins": "http://localhost:5000"}})
app.secret_key = os.environ['APP_SECRET_KEY']

# -------------------------------------------------------------------

# Index/homepage
@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index():
    html_code = flask.render_template('index.html')
    response = flask.make_response(html_code)
    return response

# Former Students 
@app.route('/former_students', methods=['GET'])
def former_students():
    html_code = flask.render_template('former_students.html')
    response = flask.make_response(html_code)
    return response

# -------------------------------------------------------------------

# Exeter Summer 
@app.route('/exeter_summer', methods=['GET'])
def exeter_summer():
    html_code = flask.render_template('exeter_summer/exeter_summer.html')
    response = flask.make_response(html_code)
    return response

# Watch Assignment
@app.route('/exeter_summer/watch', methods=['GET'])
def es_watch():
    html_code = flask.render_template('exeter_summer/watch.html')
    response = flask.make_response(html_code)
    return response

@app.route('/exeter_summer/image', methods=['GET'])
def es_image():
    html_code = flask.render_template('exeter_summer/image.html')
    response = flask.make_response(html_code)
    return response

@app.route('/exeter_summer/design', methods=['GET'])
def es_design():
    html_code = flask.render_template('exeter_summer/design.html')
    response = flask.make_response(html_code)
    return response

@app.route('/exeter_summer/lemon', methods=['GET'])
def es_lemon():
    html_code = flask.render_template('exeter_summer/lemon.html')
    response = flask.make_response(html_code)
    return response

# -------------------------------------------------------------------

# PLT Blocks
@app.route('/plt-blocks', methods=['GET'])
def plt_blocks():
    html_code = flask.render_template('plt-blocks.html')
    response = flask.make_response(html_code)
    return response

@app.route('/plt-blocks/execute_plot', methods=['POST'])
def execute_plot():
    data = flask.request.get_json()
    code = data.get('code', '')

    # Quick Checks for invalid import --------------------------------------------
    forbidden = ['import os', 'subprocess', 'open(', 'exec(', 'eval(', '__', 'sys']
    if any(f in code for f in forbidden):
        return flask.jsonify({"success": False, "message": "Unsafe code detected"}), 400
    
    # Secondary checks --------------------------------------------
    try:
        tree = ast.parse(code)
        validate_ast(tree)
    except Exception as e:
        return flask.jsonify({"success": False, "error": str(e)})

    # ----------------------------------------------------------------------------
    
    # Run code in temp Sandbox for security
    try:
        with tempfile.TemporaryDirectory(dir='/tmp') as tmpdir:
            print(f"Created temporary directory: {tmpdir}")
            script_path = os.path.join(tmpdir, "user_code.py")
            plot_file = os.path.join(tmpdir, "plot.png")
            # --- Wrap user code safely ---
# DO NOT INDENT! ---------------------------------------
            wrapped_code = f"""
import matplotlib
matplotlib.use('agg')  # disable GUI backend
import matplotlib.pyplot as plt

# --- Begin user code ---
{code}
# --- End user code ---

# Force save instead of show
plt.show()
plt.savefig(r'{plot_file}', bbox_inches='tight')
            """
# DO NOT INDENT! ---------------------------------------
            with open(script_path, "w") as f:
                f.write(wrapped_code)

            result = subprocess.run(
                ["python3", script_path],
                capture_output=True,
                text=True,
               # timeout=5,
                cwd=tmpdir
            )

            if os.path.exists(plot_file):
                print("PLT Success")
                with open(plot_file, "rb") as img_f:
                    img_base64 = base64.b64encode(img_f.read()).decode("utf-8")
            else:
                print("PLT is None")
                img_base64 = None

            return flask.jsonify({
                "success": True,
                "message": "Plot executed successfully",
                "stdout": result.stdout,
                "stderr": result.stderr,
                "image": img_base64
            })

    except subprocess.TimeoutExpired:
        print("PLT TIMEOUT")
        return flask.jsonify({"success": False, "message": "Execution timed out"}), 400

    except Exception as e:
        print("PLT EXCEPTION")
        return flask.jsonify({"success": False, "message": str(e)}), 400

# -------------------------------------------------------------------

# Test
@app.route('/testing', methods=['GET'])
def test():
    html_code = flask.render_template('test.html')
    response = flask.make_response(html_code)
    return response

if __name__ == '__main__':
    app.run(debug=True, port=5000)
