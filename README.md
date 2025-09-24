# flutter-android-docker

Flutter, Node, Firebase, Android SDK, Java SDK, Angular CLI, TypeScript.
Includes support for Angular development with ng-bootstrap (ngbp).
Can be used for github actions, vscode .devcontainer, etc


```bash
docker pull andreujuanc/flutter-android
```


## USB debugging

I use this image as a base on my vscode .devcontainer, for which I have to add:

```json
//devcontainer.json
runArgs" : [
	"--cap-add=ALL", 
	"--privileged"
],
```

Of if you need just a quick debug session for example with ADB, you can just: 
```
  docker run -it --cap-add=ALL --privileged  --entrypoint bash andreujuanc/flutter-android
```
and it will open a bash session with all the tools installed and usb connection to your devices

## Angular + ng-bootstrap (ngbp) Support

This environment now includes Angular CLI and TypeScript for developing Angular applications with ng-bootstrap:

### Quick Start for Angular Development
```bash
# Run container with port forwarding for Angular dev server
docker run -it -p 4200:4200 --entrypoint bash andreujuanc/flutter-android

# Inside container - create new Angular project
ng new my-ngbp-app
cd my-ngbp-app

# Add ng-bootstrap support
ng add @ng-bootstrap/ng-bootstrap

# Start development server (accessible at http://localhost:4200)
ng serve --host 0.0.0.0
```

### Available Tools
- **Angular CLI** (`ng`) - Project scaffolding and development
- **TypeScript** (`tsc`) - TypeScript compiler
- **ng-bootstrap** - Bootstrap components for Angular
- All existing tools (Flutter, Android SDK, Firebase, etc.)

### Example Configurations
See the `examples/angular-ngbp/` directory for sample configuration files including `package.json` and `angular.json` with ng-bootstrap setup.
