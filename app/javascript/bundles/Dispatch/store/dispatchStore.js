import { createStore } from 'redux';
import dispatchReducer from '../reducers/dispatchReducer';

const configureStore = (railsProps) => (
  createStore(dispatchReducer, railsProps)
);

export default configureStore;
