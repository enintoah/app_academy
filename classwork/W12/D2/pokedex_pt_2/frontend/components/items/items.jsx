import React from "react";

class Item extends React.Component {
  constructor(props) {
    super(props)

  }

  render() {

    return (
    <div>
        <span><img src={this.props.item.imageUrl} /></span>
    </div>
    )
  }
}

export default Item