import React from 'react';
import Title from '../Title';

class Main extends React.Component {

  constructor(props) {
    super(props);

    this.state = {
      titleId: '',
      title: null,
      error: null
    };
  }

  handleTitleIdChange(e) {
    this.setState({
      titleId: e.target.value,
    });
  }

  handleClick() {
    fetch('/titles/' + this.state.titleId + '?include=offers')
      .then((response) => {
        if (response.status === 404) {
          this.setState({
            error: 'There\'s no title with ID "' + this.state.titleId + '"',
            title: null
          });

          throw Error(response.statusText);
        }

        return response.json();
      })
      .then((data) => {
        this.setState({error: null, title: data});
      })
      .catch((error) => {
        console.log("An error has been catched.", error);
      });
  }

  render() {
    const { titleId, title, error } = this.state;

    return (
      <div>
        <div>
          Enter Title ID:
          <input value={titleId} onChange={this.handleTitleIdChange.bind(this)}/>

          <button onClick={this.handleClick.bind(this)}>
            Submit
          </button>
        </div>

        { error ? (<div>{error}</div>) : null }

        { title && <Title title={title}/> }
      </div>
    );
  }
}

export default Main;
