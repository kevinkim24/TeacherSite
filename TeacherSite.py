#!/usr/bin/env python

#-------------------------------------------------------------------
# run.py
# Author: Kevin Kim
#-------------------------------------------------------------------

import os
import flask
import urllib
#import database
#import auth
# -------------------------------------------------------------------

app = flask.Flask(__name__, template_folder='static/templates', static_folder='static')
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

# Test
@app.route('/testing', methods=['GET'])
def test():
    html_code = flask.render_template('test.html')
    response = flask.make_response(html_code)
    return response

if __name__ == '__main__':
    app.run(debug=True, port=5002)
