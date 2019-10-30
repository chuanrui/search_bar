// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import 'bootstrap/dist/css/bootstrap.css'
import PropTypes from 'prop-types'
import SearchBar from '../search_bar/search_bar'

document.addEventListener('DOMContentLoaded', () => {
  const preference = JSON.parse(document.getElementById('pref_data').getAttribute('data'))
  ReactDOM.render(
    <SearchBar terms = {preference}/>,
    document.getElementsByTagName('nav')[0].parentNode.insertBefore(document.createElement('div'), document.getElementsByTagName('nav')[0].nextSibling),
    // document.body.appendChild(document.createElement('div')),
  )
})
