import React from 'react';

class Title extends React.Component {
  render() {
    const { title } = this.props;
    const {
      data: {
        attributes,
        relationships
      }
    } = title;

    return (
      <div>
        <p>Name: {attributes.name} </p>
        <p>Available in:  </p>
        <ul>
          {attributes.formats.map(format => <li>{format}</li>)}
        </ul>
        <p>Licenses</p>

        <ul>
          {attributes.licenses.map(license => <li>{license}</li>)}
        </ul>
      </div>
    )
  }
}

export default Title;
