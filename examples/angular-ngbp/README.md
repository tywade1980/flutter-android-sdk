# Angular + ng-bootstrap Environment Configuration

This directory contains example configuration files for running Angular projects with ng-bootstrap (ngbp) in the flutter-android-sdk Docker environment.

## What's Included

- `package.json` - Node.js dependencies including Angular CLI and ng-bootstrap
- `angular.json` - Angular CLI workspace configuration
- Bootstrap integration configured for ng-bootstrap components

## Usage

1. **Create a new Angular project:**
   ```bash
   ng new my-ngbp-project
   cd my-ngbp-project
   ```

2. **Install ng-bootstrap:**
   ```bash
   ng add @ng-bootstrap/ng-bootstrap
   ```

3. **Or use the example configuration:**
   ```bash
   cp examples/angular-ngbp/package.json ./
   cp examples/angular-ngbp/angular.json ./
   npm install
   ```

4. **Start development server:**
   ```bash
   ng serve --host 0.0.0.0
   ```

## Available Tools in Environment

- **Angular CLI**: `ng` command for generating components, services, etc.
- **TypeScript**: `tsc` compiler
- **Node.js & npm**: Package management
- **Firebase Tools**: For deployment and backend services
- **Flutter**: Cross-platform app development
- **Android SDK**: Android app development and testing

## ng-bootstrap Components

The environment is configured to support all ng-bootstrap components including:
- Accordion, Alert, Buttons
- Carousel, Collapse, Datepicker
- Dropdown, Modal, Navbar
- Pagination, Popover, Progress bars
- Rating, Tabs, Timepicker
- Toast, Tooltip, and more

## Development Workflow

1. Use `ng generate` to create new components
2. Import ng-bootstrap modules in your Angular modules
3. Use bootstrap CSS classes and ng-bootstrap components
4. Test in the development server with `ng serve`
5. Build for production with `ng build --prod`

## Docker Integration

When running in the Docker container, make sure to:
- Expose port 4200 for Angular dev server: `-p 4200:4200`
- Use `--host 0.0.0.0` when running `ng serve`
- Mount your project directory as a volume for live reloading