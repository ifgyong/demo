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

class HomeScreen extends React.Component {
  render() {
    return (
      <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Button 
      title='page_01' 
      onPress={()=>{
        this.props.navigation.navigate('Page_01_p');
      }}/>
      <Button 
      title='page_02' 
      onPress={()=>{
        this.props.navigation.navigate('Page_02_p');
      }}/>
      <Button 
      title='page_03' 
      onPress={()=>{
        this.props.navigation.navigate('Page_03_p');
      }}/>
      <Button 
      title='page_04' 
      onPress={()=>{
        this.props.navigation.navigate('Page_04_p');
      }}/>
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
  },
  {
    initialRouteName: 'Home',
  }
);
const RootStack2 = createStackNavigator(
  {
    Page_03_p:{screen:Page_03},
    Page_04_p:{screen:Page_04},
  },
  {
    initialRouteName: 'Page_03_p',
  }
);
const appBottom = createBottomTabNavigator({
  Home:RootStack,
  Second:RootStack2
})
const AppContainer = createAppContainer(appBottom);

export default class App extends React.Component {
  render() {
    return <AppContainer />;
  }
}
