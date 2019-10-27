import React, {Component} from 'react';
import {
    Platform, StyleSheet, Text, View, Alert, ActionSheetIOS, ImagePickerIOS, AlertIOS, DatePickerIOS,
    TouchableHighlight
} from 'react-native';

type
Props = {};
export default class App extends Component
<
Props > {
    showSheet() {
        Alert.alert('点击了我')
    }
    showAlert() {
        Alert.alert('点击了我')
    }
    showDatePicker() {
        Alert.alert('点击了我')
    }
    render() {
        return (
            < View
        style = {styles.container} >
            < Text
        style = {styles.welcome} > 这是我的第一个程序 < /Text>
            < Text
        style = {styles.instructions} >😄<
        /Text>
        < TouchableHighlight
        onPress = () =
    >
        {
            console.log('push me ');
        }
    <
        Text > alert < /Text>

        < /TouchableHighlight>
        < /View>
    )
        ;
    }
}