import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button,Animated,FlatList} from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation';

export default class ListView extends React.Component {
state={
  li:['Job']
}
    render() {
      return (
        <View style={{  }}>
          <Button
                      title="Go back"
                      onPress={() => this.props.navigation.goBack()}

                    
                      /> 

                          <TouchableHighlight 
                              onPress={()=>{
                                    this.setState({
                                      li:this.state.li.concat([['Bob'],['Joe'],['Tas'],['Lisa']][Math.round(Math.random()*3)])
                                    })
                              }} 
                              underlayColor='#ECECEC'>
                          <View style={su.addView}>
                            <Text style={su.add}>点我添加Row</Text>
                          </View>
                          </TouchableHighlight>

                      <FlatList 
                          data={this.state.li}
                          renderItem={({index,item})=>
                          <TouchableHighlight 
                              onPress={()=>Alert.alert('index:'+index+'   value:'+item)} 
                              underlayColor='#ECECEC'>
                              <View style={su.addView}>
                              <Text style={su.line}>{''+index+'  '+item}</Text>
                          </View>
                          </TouchableHighlight>
                        
                      }
                      >

                      </FlatList>
        </View>
      );
    }
  }
  const su=StyleSheet.create({
    line:{
      flex:1,
      lineHeight:30,
      textAlign:'center',
      backgroundColor:'#96d55d',
      marginTop:2.5,
      marginLeft:5,
      marginRight:5,
      marginBottom:2.5,
      borderRadius:3,
    },
    add:{
      height:30,
      fontWeight:'bold',
      fontSize:15,
      textAlign:'center',
      marginLeft:5,
      marginRight:5,
      lineHeight:30,
      borderRadius:3,
    },
    addView:{
      marginTop:2.5,
      marginLeft:5,
      marginRight:5,
      marginBottom:2.5,
      height:30,
      backgroundColor:'#96d55d',
      borderRadius:3,

    }
  })