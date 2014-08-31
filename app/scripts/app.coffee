'use strict'

###*
 # @ngdoc overview
 # @name swarmApp
 # @description
 # # swarmApp
 #
 # Main module of the application.
###
angular.module 'swarmApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
    # autogenerated files specific to this project
    'swarmEnv', 'swarmSpreadsheetPreload'
    # http://luisfarzati.github.io/angulartics/
    'angulartics', 'angulartics.google.analytics'
  ]
angular.module('swarmApp').config ($routeProvider) ->
    $routeProvider
      #.when '/main',
      #  templateUrl: 'views/main.html'
      #  controller: 'MainCtrl'
      #.when '/about',
      #  templateUrl: 'views/about.html'
      #  controller: 'AboutCtrl'
      .when '/debug',
        templateUrl: 'views/debug.html'
        controller: 'DebugCtrl'
      #.when '/demo',
      #  templateUrl: 'views/demo.html'
      #  controller: 'DemoCtrl'
      .when '/',
        templateUrl: 'views/unitlist.html'
        controller: 'UnitlistCtrl'
      .when '/unitlist',
        templateUrl: 'views/unitlist.html'
        controller: 'UnitlistCtrl'
      .when '/unitlist/:unit',
        templateUrl: 'views/unitlist.html'
        controller: 'UnitlistCtrl'
      .when '/options',
        templateUrl: 'views/options.html'
        controller: 'OptionsCtrl'
      .when '/changelog',
        templateUrl: 'views/changelog.html'
        controller: 'ChangelogCtrl'
      .when '/statistics',
        templateUrl: 'views/statistics.html'
        controller: 'StatisticsCtrl'
      .otherwise
        redirectTo: '/'

angular.module('swarmApp').config (gaTrackingID) ->
  if gaTrackingID
    ga 'create', gaTrackingID, 'auto'
# http and https use different localstorage, which might confuse folks.
# angular $location doesn't make protocol mutable, so use window.location.
angular.module('swarmApp').config (env) ->
  if env == 'prod' and window.location.protocol == 'http:'
    window.location.protocol = 'https:'
