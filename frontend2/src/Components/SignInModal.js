import React, { Component } from 'react';

class SignInModal extends Component {

	componentDidMount(){
		const M = window.M;

		document.addEventListener('DOMContentLoaded', function() {
		    var elems = document.querySelectorAll('.modal');
		    var instances = M.Modal.init(elems, {});
		  });
	}

	render () {
    return (
      <div>
      	<a class="waves-effect waves-light btn modal-trigger" href="#modal1">Sign In</a>

		  <div id="modal1" class="modal">
		    <div class="modal-content">
		      <h4><span className="black-text">Sign In</span></h4>
		      <p><span className="black-text">A bunch of text</span></p>
		    </div>
		    <div class="modal-footer">
		      <a href="#!" class="modal-close waves-effect waves-green btn-flat">Agree</a>
		    </div>
		  </div>
      </div>
      )
	}
}

export default SignInModal;

