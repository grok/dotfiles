#!/usr/bin/env ruby

# Install all files to ~ by symlinking them,
# this way, updating them is as simple as git pull
#
# Author: Sterling Hamilton <sterling.hamilton@gmail.com>
# Date: 2024.06.19
# License: MIT
#
# Kudos to @bahamas10 for the obvious pilfering.

require 'fileutils'

def symlink(source, target)
  source_path = source.sub(/^#{Regexp.escape(ENV['HOME'])}/, '~')
  target_path = target.sub(/^#{Regexp.escape(ENV['HOME'])}/, '~')
  printf "%30s -> %s\n", source_path, target_path

  FileUtils.ln_s(source, target, force: true)
end

dotfiles = [
  'gitconfig',
  'gitignore',
  'zshrc'
]

dotfiles.each do |file|
  target = File.join(ENV['HOME'], ".#{file}")

  if File.directory?(target) && !File.symlink?(target)
    FileUtils.rm_r(target)
  end

  symlink(File.join(Dir.pwd, file), target)
end
