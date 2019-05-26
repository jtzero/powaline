#!/usr/bin/env bash

parallel --tagstring {} asdf current {} --args{} ::: nodejs ruby python elixir
