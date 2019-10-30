import React, {Component} from 'react'
import ReactDOM from 'react-dom'

class SearchBar extends Component{
    constructor(props){
        super(props);
        const items = [];
        Object.keys(this.props.terms).map((e)=>{
            items.push(e);
        });
        this.items = items
        this.state = {
            suggestions: [],
        };
        console.log(this.items)
    }
    /*filter results through regex expression*/
    onTextChanged = (e)=>{
        const values = document.getElementById('input').value.split(' ');
        const value = values[values.length-1];
        let suggestions = [];
        const times = this.props.terms;
        console.log(times.alice);
        console.log(times.acme);
        if(value.length>0){
            const regex = new RegExp(`^${value}`,'i');
            suggestions = this.items.filter(v=>regex.test(v));
            console.log(suggestions);
            suggestions.sort(function(a,b){
                return times.a-times.b;
            });
            console.log(suggestions);
        }
        this.setState(()=>({suggestions}));
    }
    /*add selected element into input field*/
    fillSelected = (text)=>{
        const preText=document.getElementById('input').value.split(' ');
        let i = 0;
        let newText = '';
        console.log(newText);
        while(i<preText.length-1){
            newText+=' '+preText[i];
            i+=1;
        }
        document.getElementById('input').value=newText.trim()+' '+text;
        const ele = document.getElementById('suggestions');
        while(ele.firstChild){
            ele.removeChild(ele.firstChild);
        }
    }
    /*generate dropdown list*/
    renderSuggestions(){
        const dropdownStyle={
            paddingLeft: 160,
            width:370
        };
        const {suggestions} = this.state;
        if(suggestions.length===0){
            return null;
        }
        return(
            <div className="list-group" style={dropdownStyle} id="suggestions">
                {suggestions.map((item)=>
                    <button type="button" className="list-group-item list-group-item-action" onClick={()=>this.fillSelected(item)}>{item}</button>
                )}
            </div>
        )
    }
    /*add keyup event to input textfield*/
    componentDidMount(){
        document.getElementById('input').addEventListener('keyup', this.onTextChanged);
    }
    render(){
        return(
            <div>
                <br></br>
                <br></br>
                {this.renderSuggestions()}
            </div>
        )
    }
}

export default SearchBar