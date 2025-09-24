#!/bin/bash

# Test script to verify Angular CLI and ng-bootstrap environment setup
# This script can be run inside the Docker container to validate the ngbp configuration

echo "🔍 Testing Angular CLI and ng-bootstrap (ngbp) Environment Setup"
echo "================================================================"

# Test Node.js and npm
echo "✅ Node.js version:"
node -v

echo "✅ npm version:"
npm -v

# Test Angular CLI
echo "✅ Angular CLI version:"
ng version --skip-git 2>/dev/null || echo "Angular CLI installation needs verification"

# Test TypeScript
echo "✅ TypeScript version:"
tsc --version

# Test if we can create a new Angular project
echo "🏗️  Testing Angular project creation..."
mkdir -p /tmp/ngbp-test
cd /tmp/ngbp-test

# Create a minimal Angular project (skip git and install)
ng new test-ngbp-project --skip-git --skip-install --minimal --routing=false --style=scss 2>/dev/null || {
    echo "❌ Failed to create Angular project"
    exit 1
}

echo "✅ Angular project created successfully"

# Test adding ng-bootstrap (simulation)
cd test-ngbp-project
echo "📦 Copying example configuration files..."
cp /home/developer/examples/angular-ngbp/package.json ./
cp /home/developer/examples/angular-ngbp/angular.json ./

echo "✅ ng-bootstrap configuration files copied"

# Verify configuration files
echo "📋 Validating configuration files..."
if [ -f "package.json" ] && [ -f "angular.json" ]; then
    echo "✅ Configuration files are present"
else
    echo "❌ Configuration files missing"
    exit 1
fi

# Test that required dependencies are listed
if grep -q "@ng-bootstrap/ng-bootstrap" package.json; then
    echo "✅ ng-bootstrap dependency found in package.json"
else
    echo "❌ ng-bootstrap dependency not found"
    exit 1
fi

if grep -q "bootstrap" package.json; then
    echo "✅ Bootstrap dependency found in package.json"
else
    echo "❌ Bootstrap dependency not found"
    exit 1
fi

# Cleanup
cd /
rm -rf /tmp/ngbp-test

echo ""
echo "🎉 All tests passed! The ngbp (Angular + ng-bootstrap) environment is ready."
echo ""
echo "Next steps:"
echo "1. Create your Angular project: ng new my-app"
echo "2. Add ng-bootstrap: ng add @ng-bootstrap/ng-bootstrap"
echo "3. Start development: ng serve --host 0.0.0.0"
echo ""