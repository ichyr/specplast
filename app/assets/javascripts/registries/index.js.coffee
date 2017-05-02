'use strict'
# Declare app level module which depends on views, and components
angular.module('myApp', [
  'ui.grid'
  'ui.grid.grouping'
]).controller 'View1Ctrl', [
  '$scope'
  '$http'
  'uiGridGroupingConstants'
  'i18nService'
  ($scope, $http, uiGridGroupingConstants, i18nService) ->
    i18nService.setCurrentLang 'ua'
    $scope.gridOptions =
      enableFiltering: true
      treeRowHeaderAlwaysVisible: false
      columnDefs: [
        {
          name: 'id'
          displayName: 'Номер'
          width: '100'
          enableGrouping: false
        }
        {
          name: 'name'
          displayName: 'Ім\'я та Прізвище'
          width: '200'
          cellTemplate: '<div class="ui-grid-cell-contents">{{row.entity.name}} {{row.entity.surname}}</div>'
        }
        {
          name: 'dob'
          displayName: 'Рік народження'
          width: '100'
          cellTemplate: '<div class="ui-grid-cell-contents">{{row.entity.dob}}</div>'
        }
        {
          name: 'sex'
          displayName: 'Стать'
          width: '100'
          cellTemplate: '<div class="ui-grid-cell-contents">{{row.entity.sex?"Жін":"Чол"}}</div>'
        }
        {
          name: 'rank'
          displayName: 'Ступінь'
          width: '100'
          cellTemplate: '<div class="ui-grid-cell-contents">{{row.entity.rank.title}}</div>'
        }
        {
          name: 'troop'
          displayName: 'Курінь'
          width: '100'
        }
        {
          name: 'group'
          displayName: 'Гурток'
          width: '100'
        }
        {
          name: 'city'
          displayName: 'Станиця'
          width: '100'
        }
        {
          name: 'region'
          displayName: 'Округа'
          width: '100'
        }
        {
          name: 'vmilist_id'
          displayName: 'Вмілість'
          width: '100'
        }
        {
          name: 'achievement_date'
          displayName: 'Дата здобуття'
          width: '100'
          enableGrouping: false
        }
        {
          name: 'place'
          displayName: 'Місце здобуття'
          width: '100'
        }
        {
          name: 'activity'
          displayName: 'Акція'
          width: '100'
        }
        {
          name: 'instruktor_id'
          displayName: 'Інструктор'
          width: '100'
          cellTemplate: '<div class="ui-grid-cell-contents"><a href="users/{{row.entity.instruktor_id}}">{{instruktor_id}}</a></div>'
        }
        {
          name: 'comment'
          displayName: 'Коментар'
          width: '300'
          enableGrouping: false
        }
        {
          name: 'photo_url'
          displayName: 'Посилання на посвідку'
          width: '200'
          cellTemplate: '<div class="ui-grid-cell-contents"><a href="{{row.entity.photo_url}}">Перейти</a></div>'
          enableGrouping: false
        }
      ]
      onRegisterApi: (gridApi) ->
        $scope.gridApi = gridApi
        return
    $scope.gridOptions.data = []
    $http.get('/registries.json').then ((response) ->
      debugger;
      $scope.gridOptions.data = response
      return
    ), (error) ->
      console.log('Error fetching registry from server');
      console.log(error);
      return
    return
]