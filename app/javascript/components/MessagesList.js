import React from "react"
import PropTypes from "prop-types"
import Avatar from "./Avatar";
class MessagesList extends React.Component {
    render () {


        return this.props.messages.map((item, index) => (
            <div className="container-fluid" key={index}>
                <div className="msg-container darker">
                    <Avatar avatar={item.avatar} currentUserId={this.props.currentUserId} messageUserId={item.user_id}/>
                    <p className="chat-user-name">
                        {item.user_name}
                    </p>
                    <p>
                        {item.content}
                    </p>
                    <span className="time-left">
                        {item.created_at}
                    </span>
                </div>
            </div>
        ));
    }
}

// PrivateMessagesContainer.propTypes = {
//     greeting: PropTypes.string
// };
export default MessagesList