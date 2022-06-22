# Elm Components: Stateful vs Stateless

## Prerequisits

To run these examples you need to have Elm installed on your machine.

### Installation via Brew

```sh
    brew install elm
```

### Installation via executable

Go to the [elm installation](https://guide.elm-lang.org/install/elm.html) page.

## Run the project

To run the project, execute the following from the project root:

```sh
    elm reactor
```

Navigate to the provided url in the command output and then select the `Main.elm` of the application you wish to run.

## Compile the project

To compile the project you can use the `elm make` command.

### To HTML

To compile the project to an `index.html` with all necessary JS included, you can run the following from the root directory:

```sh
    elm make src/<Application Name>/Main.elm
```

### To JS

To compile the project to an `index.js`, you can run the following from the root directory:

```sh
    elm make src/<Application Name>/Main.elm --output index.js
```

### Adding optimised output

To optimize the output JS you can add the `--optimize` flag to any of the above `elm make` commands.
