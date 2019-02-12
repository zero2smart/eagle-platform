import React from 'react';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';

// This will be in components
// import App from './App';

// TODO
// Not going to use this for now
// import * as serviceWorker from './serviceWorker';
// serviceWorker.unregister();

import configureStore from '../store/dispatchStore';
import DispatchContainer from '../containers/DispatchContainer';

// See documentation for https://github.com/reactjs/react-redux.
// This is how you get props from the Rails view into the redux store.
// This code here binds your smart component to the redux store.
// const DispatchApp = (props) => (
//   <Provider store={configureStore(props)}>
//     <DispatchContainer />
//   </Provider>
// );
const DispatchApp = (props) => (
  <Provider store={configureStore}>
    <DispatchContainer />
  </Provider>
);

export default DispatchApp;
