#!/usr/bin/env bash

# This file serves as a reminder to run this project from the root directory, not whatever folder I'm currently in.
# If not run from the root folder, there may be issues with Vapor Middleware

export $(grep -v '^#' ~/TMServer.env | xargs)
run
