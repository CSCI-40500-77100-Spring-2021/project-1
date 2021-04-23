import React, { Component } from 'react';

class RegisterModal extends Component {

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
      	<a class="waves-effect waves-light btn modal-trigger" href="#modal2">Register</a>

		  <div id="modal2" class="modal">
		    <div class="modal-content">
		      <h4><span className="black-text">Register</span></h4>
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

export default RegisterModal;

