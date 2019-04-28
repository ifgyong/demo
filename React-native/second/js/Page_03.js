import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button} from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation';


export default class Page_03 extends React.Component {
    render() {
      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>Page_03</Text>
          <Button
                      title="Go back"
                      onPress={() => this.props.navigation.goBack()}
                      />
        </View>
      );
    }
  }
  
  