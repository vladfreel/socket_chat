import React from 'react';
import PropTypes from "prop-types"
class Message extends React.Component{
    render() {
        var ButtonDelete, ButtonEdit;
        if (this.props.user.username===this.props.current_user.username) {
            ButtonDelete =
                <form className="button_to" method="post" action={"/messages/"+ this.props.message.id}>
                    <input type="hidden" name="_method" defaultValue="delete"/>
                    <input id={"delete-public-msg-"+ this.props.message.id} type="submit" defaultValue="Delete Message"/>
                </form>
            ButtonEdit = <button className="b_edit_message" data-id={this.props.message.id}>
                            Edit Message
                        </button>;
        }
        else {
            ButtonDelete = null;
            ButtonEdit = null;
        }
        return(
        <div className="c c card">
            <div className="card-block">
                <div className="row">
                    <div className="col-md-1">
                    </div>
                    <div className="col-md-11">
                        <p className="card-text">
        <span className="text-muted">
        {this.props.user.username} at {this.props.message.created_at} says
        </span>
                            <br/>
                        </p>
                        <pre>
            <form hidden="hidden" id={"edit_message"+ this.props.message.id} className="edit_message" action={"/messages/"+ this.props.message.id} acceptCharset="UTF8" method="post">
                <input name="utf8" type="hidden" defaultValue="✓"/>
                <input type="hidden" name="_method" defaultValue="put"/>
                <input type="text" defaultValue={this.props.message.body} name="message[body]" id="message_body"/>
                <input type="submit" name="commit" defaultValue="Update" data-disable-with="Update"/>
            </form>
            <span id={"message"+ this.props.message.id}>
            {this.props.message.body}
            </span>
            {ButtonDelete}
            {ButtonEdit}
        </pre>
                    </div>
                </div>
            </div>
        </div>
        )
    }
}
export default Message;

