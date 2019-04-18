import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button} from 'react-native';
import { createStackNavigator, createAppContainer ,navigationOptions} from 'react-navigation';


export default class Page_01 extends React.Component {
  static navigationOptions = {
    title:'第一页😄',
    headerStyle:{
      backgroundColor:'red'
    },
    headerTineColor:'#fff',
    headerTitleStyle:{
      fontWeight:'bold'
    }
  }
    render() {
      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Page1</Text>
          <Button
                      title="Go back"
                      onPress={() => this.props.navigation.goBack()}
                      />
        </View>
      );
    }
  }
  
  