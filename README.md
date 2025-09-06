### fsrs-browser-build

This repository provides a simplified way to build the [fsrs-browser](https://github.com/open-spaced-repetition/fsrs-browser) project using Docker.

**Requirements**:
- [docker](https://www.docker.com)
- [just](https://github.com/casey/just)

**Usage**:
1. Clone repository
```sh
git clone https://thenesterov/fsrs-browser-build.git && cd fsrs-browser-build
```

2. Build the project inside a Docker container:
```sh
just build
```
3. Copy the generated output files to the local directory:
```sh
just copy-output
```
You can specify a custom output directory by providing a path: 
```sh
just copy-output dist/
```

The build artifacts (e.g. WASM files, JavaScript bindings) will be placed in the specified output directory (default: `./output/`). 
