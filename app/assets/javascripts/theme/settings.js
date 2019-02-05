'use strict';

// Application

// Self Initialize DOM Factory Components
domFactory.handler.autoInit();

// Connect button(s) to drawer(s)
var sidebarToggle = Array.prototype.slice.call(document.querySelectorAll('[data-toggle="sidebar"]'));

sidebarToggle.forEach(function (toggle) {
  toggle.addEventListener('click', function (e) {
    var selector = e.currentTarget.getAttribute('data-target') || '#default-drawer';
    var drawer = document.querySelector(selector);
    if (drawer) {
      drawer.mdkDrawer.toggle();
    }
  });
});

var drawers = document.querySelectorAll('.mdk-drawer');
drawers = Array.prototype.slice.call(drawers);
drawers.forEach(function (drawer) {
  drawer.addEventListener('mdk-drawer-change', function (e) {
    if (!e.target.mdkDrawer) {
      return;
    }
    document.querySelector('body').classList[e.target.mdkDrawer.opened ? 'add' : 'remove']('has-drawer-opened');
    var button = document.querySelector('[data-target="#' + e.target.id + '"]');
    if (button) {
      button.classList[e.target.mdkDrawer.opened ? 'add' : 'remove']('active');
    }
  });
});

// SIDEBAR COLLAPSE MENUS
$('.sidebar .collapse').on('show.bs.collapse', function (e) {
  e.stopPropagation();
  var parent = $(this).parents('.sidebar-submenu').get(0) || $(this).parents('.sidebar-menu').get(0);
  $(parent).find('.open').find('.collapse').collapse('hide');
  $(this).closest('li').addClass('open');
});
$('.sidebar .collapse').on('hidden.bs.collapse', function (e) {
  e.stopPropagation();
  $(this).closest('li').removeClass('open');
});

// ENABLE TOOLTIPS
$('[data-toggle="tooltip"]').tooltip();

// ENABLE TABS
$('[data-toggle="tab"]').on('hide.bs.tab', function (e) {
  $(e.target).removeClass('active');
});

// SETTINGS
// APP SETTINGS
var hexToRGB = function hexToRGB(hex, alpha) {
  var r = parseInt(hex.slice(1, 3), 16);
  var g = parseInt(hex.slice(3, 5), 16);
  var b = parseInt(hex.slice(5, 7), 16);

  if (alpha) {
    return "rgba(" + r + ", " + g + ", " + b + ", " + alpha + ")";
  } else {
    return "rgb(" + r + ", " + g + ", " + b + ")";
  }
};

var fonts = { base: "Helvetica Neue"

  // https://material.io/design/color/the-color-system.html#tools-for-picking-colors
};var colors = {
  bodyBg: '#F7F8F9',
  border: '#efefef',
  gray: {
    50: '#edeef0',
    100: '#d0d6dc',
    200: '#b2bac4',
    300: '#939fad',
    400: '#7c8a9b',
    500: '#65778a',
    600: '#586879',
    700: '#485563',
    800: '#39424d',
    900: '#272e36'
  },
  primary: {
    50: '#e4f3ff',
    100: '#bddfff',
    200: '#93ccff',
    300: '#68b8ff',
    400: '#49a8ff',
    500: '#3099ff',
    600: '#308AF3', // $primary
    700: '#2d79df',
    800: '#2b67cd',
    900: '#2648ad'
  },
  success: {
    50: '#edf9e6',
    100: '#d1f0c2',
    200: '#b2e599',
    300: '#91db6e',
    400: '#75d34a',
    500: '#58ca1f',
    600: '#47ba16', // $success
    700: '#2ba607',
    800: '#009200',
    900: '#006f00'
  },
  danger: {
    50: '#feeaef',
    100: '#fccad5',
    200: '#ec949f',
    300: '#e26979',
    400: '#ee405a',
    500: '#f52042',
    600: '#e51240',
    700: '#d3003a',
    800: '#c60032',
    900: '#b70026'
  },
  black: '#12263F',
  white: '#FFFFFF',
  transparent: 'transparent',
  get: function get(color) {
    return color.split('.').reduce(function (o, i) {
      return o[i];
    }, this);
  }
};

var charts = {
  colorScheme: 'light',
  colors: {
    area: hexToRGB(colors.primary[100], 0.5)
  }
};

var settings = {
  fonts: fonts,
  colors: colors,
  charts: charts,
  hexToRGB: hexToRGB
};

if (typeof window !== 'undefined') {
  window.settings = settings;
}
// END SETTINGS