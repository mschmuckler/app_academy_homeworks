import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = "RECEIVE_SEARCH_GIPHYS";

export const fetchSearchGiphys = (searchTerm) => {
  return (dispatch) => {
    return APIUtil.fetchSearchGiphys(searchTerm).then((resp) => {
      return dispatch(receiveSearchGiphys(resp.data));
    });
  };
};

export const receiveSearchGiphys = (giphys) => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys: giphys
  };
};
