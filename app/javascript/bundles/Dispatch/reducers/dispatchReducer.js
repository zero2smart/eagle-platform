import { combineReducers } from 'redux';
import { DISPATCH_NAME_UPDATE } from '../constants/dispatchConstants';

const name = (state = '', action) => {
  switch (action.type) {
    case DISPATCH_NAME_UPDATE:
      return action.text;
    default:
      return state;
  }
};

const dispatchReducer = combineReducers({ name });

export default dispatchReducer;
