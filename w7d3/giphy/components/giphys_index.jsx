import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = (props) => {
  const giphyList = props.giphys.map((giphy, idx) => {
    return <GiphysIndexItem giphy={ giphy } key={ idx } />
  });

  return (
    <ul>{ giphyList }</ul>
  );
};

export default GiphysIndex;
