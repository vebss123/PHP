from flask import Flask, render_template, request, redirect, url_for
import os

app = Flask(__name__)

# Dummy user data for authentication
USERS = {'admin': 'password123'}

@app.route('/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if username in USERS and USERS[username] == password:
            return redirect(url_for('welcome', username=username))
        else:
            return "Invalid credentials, please try again.", 401
    return render_template('login.html')

@app.route('/welcome/<username>')
def welcome(username):
    return f'Welcome Back, {username}!'

if __name__ == '__main__':
    # Use PORT environment variable, default to 8080 if not set
    port = int(os.environ.get('PORT', 8080))
    # Run the application on host 0.0.0.0 and the specified port
    app.run(host='0.0.0.0', port=port)
