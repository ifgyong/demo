/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button} from 'react-native';
import { createStackNavigator, createAppContainer, createBottomTabNavigator } from 'react-navigation';
import Page_01 from './js/Page_01.js'
import Page_02 from './js/Page_02.js';
import Page_03 from './js/Page_03.js'
import Page_04 from './js/Page_04.js';
import FYTimer from './js/FYTimer'
import FontAwesome, { Icons } from 'react-native-fontawesome';
import Icon from 'react-native-fontawesome';
import ListView from './js/ListView'


class HomeScreen extends React.Component {
  render() {
    return (
      <View style={{ flex:1 }}>

          <TouchableHighlight onPress={()=>{this.props.navigation.navigate('Page_01_p');}} underlayColor='Black'>
          <View style = {sty.button}>
          <Text style = {sty.button1}>label  alert  sheet</Text>
          </View>

          </TouchableHighlight>

          <TouchableHighlight onPress={()=>{this.props.navigation.navigate('Page_02_p');}} underlayColor='Black'>
          <View style = {sty.button}>
          <Text style = {sty.button1}>ScrollView flow/column/row</Text>
          </View>

          </TouchableHighlight>
          <TouchableHighlight onPress={()=>{this.props.navigation.navigate('Page_03_p');}} underlayColor='Black'>
          <View style = {sty.button}>
          <Text style = {sty.button1}>Image</Text>
          </View>
          </TouchableHighlight>
      <Button 
      title='page_04' 
      onPress={()=>{
        this.props.navigation.navigate('Page_04_p');
      }}/>
        <Button 
      title='log' 
      onPress={()=>{
        this.props.navigation.navigate('Page_05_p');
      }}/>
    
          <TouchableHighlight onPress={()=>{this.props.navigation.navigate('Page_06_p');}} underlayColor='Black'>
          <View style = {sty.button}>
          <Text style = {sty.button1}>ListView</Text>
          </View>
          </TouchableHighlight>
      </View>
    );
  }
}

class DetailsScreen extends React.Component {
  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
        <Text>Details Screen</Text>
        <Button
                    title="Go back"
                    onPress={() => this.props.navigation.goBack()}
                    />
      </View>
    );
  }
}

const RootStack = createStackNavigator(
  {
    Home: {screen:HomeScreen},
    Details: {screen:DetailsScreen},
    Page_01_p:{screen:Page_01},
    Page_02_p:{screen:Page_02},
    Page_03_p:{screen:Page_03},
    Page_04_p:{screen:Page_04},
    Page_05_p:{screen:FYTimer},
    Page_06_p:{screen:ListView},
  },
  {
    initialRouteName: 'Home',
  }
);
const RootStack2 = createStackNavigator(
  {
    Page_02_p:{screen:Page_02},
    Page_04_p:{screen:Page_04},
  },
  {
    initialRouteName: 'Page_02_p',
  }
);
const RootStack3 = createStackNavigator(
  {
    Page_03_p:{screen:Page_03},
  },
  {
    initialRouteName: 'Page_03_p',
  }
);
const RootStack4 = createStackNavigator(
  {
    Page_04_p:{screen:Page_04},
    Page_05_p:{screen:Page_04},
  },
  {
    initialRouteName: 'Page_04_p',
  }
);
const appBottom = createBottomTabNavigator({
  Home:{
    screen: RootStack,
    tabBarOptions:{
      showIcon:true,
      tabBarIcon:()=>
      <Icon name='1' 
        type = 'font-awesome'/>
    }
  },
  Second:{screen:RootStack2},
  Three:{screen:RootStack3},
  Four:{screen:RootStack4},
})
const AppContainer = createAppContainer(appBottom);

export default class App extends React.Component {
  render() {
    return <RootStack />;
  }
}
const sty = StyleSheet.create({
  label1:{
    fontSize:30,
    color:'white',
    // flex:auto,
    backgroundColor:'red'
  },
  label2:{
    fontSize:20,
    flex:1,
    fontWeight:'bold',
    backgroundColor:'#006400',
    alignItems:'center'
  },
  button:{
    // flex:1,
    // width:100,
    alignItems:'center',
    // alignSelf:'center',
    height:30,
    marginTop:10,
    marginLeft:10,
    marginRight:10,
    backgroundColor:'#96d55d',
    borderRadius:5,
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
    color:'#222222',
    fontWeight:'bold'
  }
})