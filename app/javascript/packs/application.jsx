/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);

import React from 'react';
import ReactDOM from 'react-dom';

import Main from '../components/Main';
import { AppContainer } from 'react-hot-loader';

const render = (Component) => {
  const rootEl = document.getElementById('react-root'); // eslint-disable-line no-undef
  ReactDOM.render(<Component />, rootEl);
};

document.addEventListener('DOMContentLoaded', () => { // eslint-disable-line no-undef
  render(Main);
});

// Webpack Hot Module Replacement API
if (module.hot) {
    module.hot.accept('../components/Main', () => {
        const next = require('../components/Main').default;

        render(next);
    });
}
