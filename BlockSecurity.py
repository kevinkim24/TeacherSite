import ast

def validate_ast(tree):
    SAFE_IMPORTS = {"matplotlib", "numpy"}

    for node in ast.walk(tree):
        # Disallow import of unsafe modules
        if isinstance(node, (ast.Import, ast.ImportFrom)):
            names = [n.name.split('.')[0] for n in node.names]
            for n in names:
                if n not in SAFE_IMPORTS:
                    raise ValueError(f"Import of '{n}' not allowed")

        # Disallow attributes like __dict__, __class__, etc.
        if isinstance(node, ast.Attribute):
            if node.attr.startswith("__"):
                raise ValueError(f"Access to attribute '{node.attr}' not allowed")

        # Disallow system-level calls
        if isinstance(node, ast.Call):
            if isinstance(node.func, ast.Name) and node.func.id in ["exec", "eval", "open", "__import__"]:
                raise ValueError(f"Function '{node.func.id}' not allowed")