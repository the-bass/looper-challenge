import React from 'react';
import Title from '../Title';

class Main extends React.Component {


  sampleData() {
    const title = {
      data: {
        attributes: {
          name: '12 Strong',
          platform: 'itunes',
          formats: ['HD', 'SD'],
          licenses: ['buy', 'rent'],
        },
        relationships: {
          offers: [
            { id: 101, type: 'offer' },
            { id: 102, type: 'offer' },
            { id: 103, type: 'offer' },
            { id: 104, type: 'offer' },
          ]
        }
      },
      included: [
        {
          type: 'offer',
          id: 101,
          attributes: {
            format: 'HD',
            license: 'buy',
            price: 1399
          }
        },
        {
          type: 'offer',
          id: 102,
          attributes: {
            format: 'HD',
            license: 'rent',
            price: 549
          }
        },
        {
          type: 'offer',
          id: 103,
          attributes: {
            format: 'SD',
            license: 'buy',
            price: 999
          }
        },
        {
          type: 'offer',
          id: 104,
          attributes: {
            format: 'SD',
            license: 'rent',
            price: 549
          },
        },
      ]
    };

    return title;
  }
  constructor(props) {
    super(props);

    this.state = {
      titleId: '',
      title: null,
    };
  }

  handleTitleIdChange(e) {
    this.setState({
      titleId: e.target.value,
    });
  }

  handleClick() {
    // this should come back from the API
    const title = this.sampleData();

    this.setState({
      title,
    });
  }

  render() {
    const { titleId, title } = this.state;

    return (
      <div>
        Enter Title ID:
        <input value={titleId} onChange={this.handleTitleIdChange.bind(this)}/>

        <button onClick={this.handleClick.bind(this)}>
          Submit
        </button>

        { title && <Title title={title}/> }
      </div>
    );
  }
}

export default Main;
