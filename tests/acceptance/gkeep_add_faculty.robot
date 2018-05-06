# Copyright 2018 Nathan Sommer and Ben Coleman
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.


*** Settings ***
Library    gkeeprobot.keywords.ServerSetupKeywords
Library    gkeeprobot.keywords.ServerCheckKeywords
Library    gkeeprobot.keywords.ClientSetupKeywords
Library    gkeeprobot.keywords.ClientCheckKeywords
Resource    resources/setup.robot
Force Tags    gkeep_add_faculty

*** Test Cases ***

Add One Faculty
    [Tags]    happy_path
    Reset Server
    Reset Client
    Add File To Server    keeper    files/valid_server.cfg     server.cfg
    Start gkeepd
    Expect Email    to_user=admin_prof    contains=Password
    Setup Faculty Accounts    admin_prof
    Gkeep Add Faculty Succeeds    admin_prof    prof2
    Expect Email    to_user=prof2    contains=Password
    Server Running

Duplicate Faculty
    [Tags]    error
    Reset Server
    Reset Client
    Add File To Server    keeper    files/valid_server.cfg     server.cfg
    Start gkeepd
    Setup Faculty Accounts    admin_prof
    Gkeep Add Faculty Succeeds    admin_prof    prof2
    Expect Email    to_user=prof2    contains=Password
    Gkeep Add Faculty Fails    admin_prof    prof2
    Server Running