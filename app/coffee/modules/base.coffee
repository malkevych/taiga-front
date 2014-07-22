###
# Copyright (C) 2014 Andrey Antukh <niwi@niwi.be>
# Copyright (C) 2014 Jesús Espino Garcia <jespinog@gmail.com>
# Copyright (C) 2014 David Barragán Merino <bameda@dbarragan.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# File: modules/base.coffee
###

taiga = @.taiga
groupBy = @.taiga.groupBy
bindOnce = @.taiga.bindOnce

module = angular.module("taigaBase", ["taigaLocales"])

#############################################################################
## Main Directive
#############################################################################

TaigaMainDirective = ($rootscope, $window) ->
    link = ($scope, $el, $attrs) ->
        $window.onresize = () ->
            $rootscope.$broadcast("resize")

    return {link:link}

module.directive("tgMain", ["$rootScope", "$window", TaigaMainDirective])

#############################################################################
## Navigation
#############################################################################

urls = {
    "home": "/",
    "login": "/login",
    "forgot-password": "/forgot-password",
    "change-password": "/change-password/:token",
    "register": "/register",
    "invitation": "/invitation/:token",

    "profile": "/:user",

    "project": "/project/:project",
    "project-backlog": "/project/:project/backlog",
    "project-taskboard": "/project/:project/taskboard/:sprint",
    "project-kanban": "/project/:project/kanban",
    "project-issues": "/project/:project/issues",
    "project-search": "/project/:project/search",

    "project-userstories-detail": "/project/:project/us/:ref",
    "project-userstories-detail-edit": "/project/:project/us/:ref/edit",

    "project-tasks-detail": "/project/:project/tasks/:ref",
    "project-tasks-detail-edit": "/project/:project/tasks/:ref/edit",

    "project-issues-detail": "/project/:project/issues/:ref",
    "project-issues-detail-edit": "/project/:project/issues/:ref/edit",

    # Admin
    "project-admin-home": "/project/:project/admin/project-profile/details",
    "project-admin-project-profile-details": "/project/:project/admin/project-profile/details",
    "project-admin-project-profile-default-values": "/project/:project/admin/project-profile/default-values",
    "project-admin-project-profile-features": "/project/:project/admin/project-profile/features",
    "project-admin-project-values-us-status": "/project/:project/admin/project-values/us-status",
    "project-admin-memberships": "/project/:project/admin/memberships"
}

init = ($log, $navurls) ->
    $log.debug "Initialize navigation urls"
    $navurls.update(urls)

module.run(["$log", "$tgNavUrls", init])
