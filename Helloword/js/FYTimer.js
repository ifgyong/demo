import React, {Component} from 'react';
import {Platform, StyleSheet, Text, View,TouchableHighlight,Alert,Button,Animated} from 'react-native';
import { createStackNavigator, createAppContainer } from 'react-navigation';

export default class FYTimer extends React.Component {

    render() {
      return (
        <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
          <Text>FYTimer</Text>
          <Button
                      title="Go back"
                      onPress={() => {console.log('🐲');
                      }}
                      />




        </View>
      );
    }
  }