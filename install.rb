#!/usr/bin/env ruby

# Install all files to ~ by symlinking them,
# this way, updating them is as simple as git pull
#
# Author: Sterling Hamilton <sterling.hamilton@gmail.com>
# Date: 2024.06.24
# License: MIT
#
# Kudos to @bahamas10 for the obvious pilfering/inspiration.

# We could just use `File` instead of `FileUtils` but
# we want an easy way to truck over existing files.
require 'fileutils'

links = [
  {
    source: "gitconfig",
    target: "#{ENV['HOME']}/.gitconfig"
  },
  {
    source: "gitignore",
    target: "#{ENV['HOME']}/.gitignore"
  },
  {
    source: "nvim",
    target: "#{ENV['HOME']}/.config/nvim"
  },
  {
    source: "zshrc",
    target: "#{ENV['HOME']}/.zshrc"
  }
]

changes = []

# This is purely for display purposes.
def collect_changes(source, target, changes)
  regex = /^#{Regexp.escape(ENV['HOME'])}/

  source_path = source.sub(regex, '~')
  target_path = target.sub(regex, '~')

  changes << "%30s -> %s" % [source_path, target_path]
end

def symlink(source, target, changes)
  collect_changes(source, target, changes)
  FileUtils.ln_s(source, target, force: true)
end

def prompt_to_remove(target)
  puts "Target #{target} exists. Do you want to remove it? [y/N]"
  response = $stdin.gets.chomp.downcase
  response == 'y'
end

links.each do |file|
  source = File.join(Dir.pwd, file[:source])
  target = file[:target]

  if File.exist?(target)
    if prompt_to_remove(target)
      FileUtils.rm_r(target)
    else
      puts "Skipping #{target}"
      next
    end
  end

  symlink(source, target, changes)
end

puts changes
