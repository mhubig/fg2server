from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    return 'Hello World'

@app.route("/newdata/<logger>")
def newdata(logger):
    return "New data for logger {}".format(logger)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
