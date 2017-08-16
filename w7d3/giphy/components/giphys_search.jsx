import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = { searchTerm: "" };

    this.handleClick = this.handleClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleClick(e) {
    e.preventDefault;
    this.props.fetchSearchGiphys(this.state.searchTerm);
  }

  handleChange(e) {
    const newValue = e.target.value;
    this.setState({ searchTerm: newValue });
  }

  render() {
    return (
      <div>
        <form>
          <input value={ this.state.searchTerm } onChange={ this.handleChange }/>
          <button onClick={ this.handleClick }>Submit</button>
        </form>

        <GiphysIndex giphys={ this.props.giphys } />
      </div>
    );
  }
}

export default GiphysSearch;
