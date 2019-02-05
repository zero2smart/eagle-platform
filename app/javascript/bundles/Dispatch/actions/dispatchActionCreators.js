/* eslint-disable import/prefer-default-export */

import { DISPATCH_NAME_UPDATE } from '../constants/dispatchConstants';

export const updateName = (text) => ({
  type: DISPATCH_NAME_UPDATE,
  text,
});
