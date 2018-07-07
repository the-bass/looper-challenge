import React from 'react';

class Title extends React.Component {
  find(objects, type, id) {
    for (let i = 0; i < objects.length; i++) {
      const obj = objects[i];
      if (obj.id === id) return obj;
    }

    return null;
  }

  find_all(objects, type, ids) {
    const matches = [];

    for (let i = 0; i < ids.length; i++) {
      const match = this.find(objects, type, ids[i]);
      matches.push(match);
    }

    return matches;
  }

  render() {
    const { title } = this.props;
    const {
      data: {
        attributes,
        relationships
      },
      included
    } = title;
    const offerIds = relationships.offers.data.map(offer_meta => offer_meta.id);
    const offers = this.find_all(included, 'offer', offerIds);

    return (
      <div>
        <p>Name: {attributes.name}</p>
        <p>Available in:</p>
        <ul>
          {offers.map((offer, index) => <li key={index + 'F'}>{offer.attributes.format}</li>)}
        </ul>
        <p>Licenses</p>

        <ul>
          {offers.map((offer, index) => <li key={index + 'L'}>{offer.attributes.license}</li>)}
        </ul>
      </div>
    )
  }
}

export default Title;
