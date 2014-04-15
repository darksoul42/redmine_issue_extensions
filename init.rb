# Issue Extensions plugin for Redmine
# Copyright (C) 2010-2012  Takashi Takebayashi
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
require 'issue_extensions_issue_hooks'
#require 'issue_extensions_issue_patch'
require 'issue_extensions_projects_helper_patch'

Redmine::Plugin.register :redmine_issue_extensions do
  name 'Redmine Issue Extensions plugin'
  author 'Takashi Takebayashi'
  url "http://www.r-labs.org/projects/issueext" if respond_to?(:url)
  description 'This is a Issue Extensions plugin for Redmine'
  version '0.2.0'
  requires_redmine :version_or_higher => '1.4.0'

  project_module :issue_extensions do
    permission :manage_issue_extensions, {:issue_extensions_settings => [:show, :update]}, :require => :member
  end
end

Rails.configuration.to_prepare do
  require_dependency 'projects_helper'
  ProjectsHelper.send(:include, IssueExtensionsProjectsHelperPatch) unless ProjectsHelper < IssueExtensionsProjectsHelperPatch
  #require_dependency 'issue'
  #Issue.send(:include, IssueExtensionsIssuePatch) unless Issue < IssueExtensionsIssuePatch
  
end
