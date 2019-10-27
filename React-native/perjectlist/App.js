/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component, PropTypes} from 'react';
import {Platform, StyleSheet, Text, View, TouchableHighlight, NavigatorIOS} from 'react-native';
import sheet from './pages/actionSheet'

const instructions = Platform.select({
    ios: 'Press Cmd+R to reload,\n' + 'Cmd+D or shake for dev menu',
    android:
        'Double tap R on your keyboard to reload,\n' +
        'Shake or press menu button for dev menu',
});
export default class NavigatorIOSAPP extends Component {
    render() {
        return
    <
        NavigatorIOS
        initalRoute = {
        {
            component:App,
                title
        :
            '首页'
        }
    }
        style = {
        {
            flex:1
        }
    }><
        /NavigatorIOS>
    }
}
type
Props = {};

class App extends Component

<
Props > {
    static propTypes = {
        title: PropTypes.string.isRequired,
        Navigator: PropTypes.object.isRequired,
    }
    constructor(props, context) {
        super(props, context);
        this._Forward = this._Forward.bind(this);
        this._onBack = this._onBack.bind(this);
    }
    _Forward() {
        this.props.Navigator.push({
            title: 'index' + indexed,
        });
    }
    render() {
        return (
            < View
        style = {styles.container} >
            < Text
        style = {styles.welcome} > 这是我的第一个程序 < /Text>
            < Text
        style = {styles.instructions} > {instructions} < /Text>
            < TouchableHighlight
        onPress = {this._Forward} >
            < Text
        style = {styles.welcome} > push
        me < /Text>
        < /TouchableHighlight>
        < /View>
    )
        ;
    }
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10,
        backgroundColor: 'red',

    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    },
});
