'use strict';

// Declare app level module which depends on views, and components
angular
  .module('specplast', ['ui.grid', 'ui.grid.grouping'])
  .controller('RegistryListing', [
    '$scope',
    '$http',
    'uiGridGroupingConstants',
    'i18nService',
    function($scope, $http, uiGridGroupingConstants, i18nService) {
      i18nService.setCurrentLang('ua');

      $scope.gridOptions = {
        enableFiltering: true,
        treeRowHeaderAlwaysVisible: false,
        columnDefs: [
          {
            name: 'id',
            displayName: 'Номер',
            width: '100',
            enableGrouping: false
          },
          {
            name: 'name',
            displayName: "Ім'я та Прізвище",
            width: '200',
            cellTemplate:
              '<div class="ui-grid-cell-contents">{{row.entity.name}} {{row.entity.surname}}</div>'
          },
          {
            name: 'dob',
            displayName: 'Рік нар.',
            width: '100',
            cellTemplate:
              '<div class="ui-grid-cell-contents text-center">{{row.entity.dob}}</div>'
          },
          {
            name: 'sex',
            displayName: 'Стать',
            width: '100',
            cellTemplate:
              '<div class="ui-grid-cell-contents text-center">{{row.entity.sex?"Чол":"Жін"}}</div>'
          },
          {
            name: 'rank',
            displayName: 'Ступінь',
            width: '100',
            cellClass: 'text-center'
          },
          { name: 'troop', displayName: 'Курінь', width: '150' },
          { name: 'group', displayName: 'Гурток', width: '150' },
          { name: 'city', displayName: 'Станиця', width: '150' },
          { name: 'region', displayName: 'Округа', width: '150' },
          { name: 'vmilist', displayName: 'Вмілість', width: '150' },
          {
            name: 'achievement_date',
            displayName: 'Дата здобуття',
            width: '150',
            enableGrouping: false
          },
          { name: 'place', displayName: 'Місце здобуття', width: '150' },
          { name: 'activity', displayName: 'Акція', width: '150' },
          {
            name: 'instruktor',
            displayName: 'Інструктор',
            width: '150',
            cellTemplate:
              '<div class="ui-grid-cell-contents txt-center"><a href="users/{{row.entity.instruktor_id}}">{{row.entity.instruktor}}</a></div>'
          },
          {
            name: 'comment',
            displayName: 'Коментар',
            width: '300',
            enableGrouping: false,
            cellTemplate:
              '<div class="ui-grid-cell-contents txt-center" title="{{row.entity.comment}}">{{row.entity.comment}}</div>'
          },
          {
            name: 'photo_url',
            displayName: 'Посвідка',
            width: '100',
            cellTemplate:
              '<div class="ui-grid-cell-contents text-center"><a href="{{row.entity.photo_url}}">перейти</a></div>',
            enableGrouping: false
          }
        ],
        onRegisterApi: function(gridApi) {
          $scope.gridApi = gridApi;
        }
      };

      $scope.gridOptions.data = [];
      $http.get('/registries.json').then(
        function successCallback(response) {
          $scope.gridOptions.data = response.data;
        },
        function errorCallback(error) {
          console.log(
            'Error occured. Please refresh web page or contact administrators.'
          );
          console.log(error);
        }
      );
    }
  ]);
