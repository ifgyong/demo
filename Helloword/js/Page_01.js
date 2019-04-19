import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button,ActionSheetIOS} from 'react-native';
import { createStackNavigator, createAppContainer ,navigationOptions} from 'react-navigation';

export default class Page_01 extends React.Component {
  static navigationOptions = {
    title:'第一页😄',
    headerStyle:{
      // backgroundColor:'red'
    },
    headerTineColor:'#fff',
    headerTitleStyle:{
      fontWeight:'bold'
    }
  }
  _pop(){
    Alert.alert(
         'Alert Title',
         'My Alert Msg',
         [
           {text: 'Ask me later', onPress: () => console.log('Ask me later pressed')},
           {text: 'Cancel', onPress: () => console.log('Cancel Pressed'), style: 'cancel'},
           {text: 'OK', onPress: () => console.log('OK Pressed')},
         ]
       )
  }
  _pop2(){
    ActionSheetIOS.showActionSheetWithOptions(
      {
        options: ['Cancel', 'Remove','QQ','WeChat'],
        destructiveButtonIndex: 1,
        cancelButtonIndex: 0,
      },
      (buttonIndex) => {
        if (buttonIndex === 1) {
          /* destructive action */
        }
      },
    );
  }
    render() {
      return (
        <View style={{ flex: 1 }}>
        <View style={{flex:1}}>
          <Text style={sty.label1}>自动扩充的没有flex属性自动扩充的没有flex属性、自动扩充的没有flex属性</Text>
          <Text style={sty.label2}>属性是：lex:1</Text>
        </View>
        <View style={{flex:1,}}>
          <TouchableHighlight onPress={this._pop } underlayColor='Black'>
          <View style = {sty.button}>
          <Text style = {sty.button1}>Alert</Text>
          </View>
        
        </TouchableHighlight>

      <TouchableHighlight onPress={this._pop2 } underlayColor='Black'>
          <View style = {sty.button}>
          <Text style = {sty.button1}>Sheet</Text>
          </View>
        
      </TouchableHighlight>

         <TouchableHighlight onPress={()=>{this.props.navigation.goBack()}} underlayColor='Black'>
          <View style = {sty.button}>
          <Text style = {sty.button1}>返回</Text>
          </View>
        
      </TouchableHighlight>
        </View>
        </View>
      );
    }
  }


  const sty = StyleSheet.create({
    label1:{
      fontSize:30,
      color:'red',
      // backgroundColor:'red'
    },
    label2:{
      fontSize:20,
      flex:1,
      fontWeight:'bold',
      backgroundColor:'#006400',
      alignItems:'center',
      borderRadius:5,
      borderColor:'white',

    },
    button:{
      // flex:1,
      // width:100,
      alignItems:'center',
      borderRadius:5,
      height:30,
      marginTop:10,
      marginLeft:10,
      marginRight:10,
      backgroundColor:'#55b937',
    },
    button1:{
      alignItems:'center',
      alignSelf:'auto',
      ...Platform.select({
          ios:{
            lineHeight:30,
          },
          android:{

          }
      }),
      color:'white',
    }
  })
  
  