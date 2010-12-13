@echo off
if not exist %FS_CORE_APP%\svn\NUL goto _END
SET SVN_EDITOR=vim
set NEWPATH=%FS_CORE_APP%\svn\bin;%NEWPATH%
:_END