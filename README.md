# Heroku buildpack: PredictionIO

This is a Heroku buildpack for building and deploying Prediction IO recommendation engine.

## Usage

Create a Git repository for a PredictionIO app:

    $ cd myRecommendationApp
    $ ls
    README.md	build.sbt	data	engine.json	manifest.json	project		src
    $ git init
    Initialized empty Git repository in /Users/bhagwat/myRecommendationApp/.git/
    $ git commit -m init
    [master (root-commit) 7febdd9] init
     58 files changed, 2788 insertions(+), 0 deletions(-)
     create mode 100644 README.md
     create mode 100644 .gitignore
     create mode 100644 engine.json
     create mode 100644 manifest.json
    ...
    
Create a Heroku app on the Cedar stack

    $ heroku create --stack cedar
    Creating vivid-mist-9984... done, stack is cedar
    http://vivid-mist-9984.herokuapp.com/ | git@heroku.com:vivid-mist-9984.git
    Git remote heroku added

Push the app to Heroku

    $ git push heroku master
    Counting objects: 73, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (69/69), done.
    Writing objects: 100% (73/73), 97.82 KiB, done.
    Total 73 (delta 2), reused 0 (delta 0)

    -----> Heroku receiving push
    -----> PredictionIO App detected
    ...
    

### Auto-detection

Heroku auto-detects PredictionIO apps by the existence of the `engine.json` file in the root directory.

### Using a Customized (Forked) Build Pack

This is the default buildpack repository for Grails. You can fork this repo and tell Heroku to use the forked version by passing the `--buildpack` option to `heroku create`:

    $ heroku create --stack cedar --buildpack git@github.com:bhagwat/heroku-buildpack-predictionio.git

## License

Licensed under the MIT License. See LICENSE file.
