/* Copyright (c) 2013 BlackBerry Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import bb.cascades 1.2

TabbedPane {
    attachedObjects: [
        ComponentDefinition {
            id: helpSheetDefinition
            HelpSheet {

            }
        },
        ComponentDefinition {
            id: settingsSheetDefinition
            SettingsSheet {

            }
        }
    ]

    Menu.definition: MenuDefinition {
        // Add a Help action
        helpAction: HelpActionItem {
            onTriggered: {
                var help = helpSheetDefinition.createObject(app)
                help.open();
            }
        }

        // Add any remaining actions
        actions: [
            ActionItem {
                title: qsTr("Invite To Download") + Retranslate.onLanguageChanged
                imageSource: "asset:///images/invite.png"
                enabled: bbmHandler.allowed
                onTriggered: {
                    bbmHandler.sendInvite();
                }
            }

        ]

        // Add a Settings action
        settingsAction: SettingsActionItem {
            onTriggered: {
                var settings = settingsSheetDefinition.createObject(app)
                settings.open();
            }
        }
    }

    paneProperties: NavigationPaneProperties {

    }

    Tab {
        title: qsTr("Home") + Retranslate.onLanguageChanged
        imageSource: "asset:///images/home.png"
        delegate: Delegate {
            Home {
            }
        }
    }
    Tab {
        title: qsTr("McMaster")
        imageSource: "asset:///images/get.png"
        
        NavigationPane {
            id: httpGetNavPane
            
            onPopTransitionEnded: page.destroy()
            
            Page {
                Container {
                    layout: DockLayout {}
                    
                    // The background image
                    ImageView {
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Fill
                        
                        imageSource: "asset:///images/background.png"
                    }
                    
                    Container {
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Top
                        
                        background: Color.Black
                        
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            
                            text: qsTr("GET REQUESTS")
                            
                            textStyle {
                                base: SystemDefaults.TextStyles.BigText;
                                color: Color.White
                                fontStyle: FontStyle.Italic
                                fontWeight: FontWeight.Bold
                                textAlign: TextAlign.Center
                            }
                        }
                    }
                    
                    Container {
                        horizontalAlignment: HorizontalAlignment.Fill
                        verticalAlignment: VerticalAlignment.Center
                        //! [1]
                        Button {
                            horizontalAlignment: HorizontalAlignment.Center
                            
                            text: qsTr("Get Request Headers")
                            
                            onClicked: {
                                httpGetNavPane.push(requestinfoPageDefinition.createObject());
                            }
                            
                            attachedObjects: ComponentDefinition {
                                id: requestinfoPageDefinition
                                source: "requestinfo.qml"
                            }
                        }
                        //! [1]
                    }
                }
            }
        }
    }
    Tab {
        title: qsTr("BBM") + Retranslate.onLanguageChanged
        imageSource: "asset:///images/bbm.png"
        delegate: Delegate {
            BBM {
            }
        }
    }
    Tab {
        title: qsTr("Invoke") + Retranslate.onLanguageChanged
        imageSource: "asset:///images/share.png"
        delegate: Delegate {
            Invoke {
            }
        }
    }
    Tab {
        title: qsTr("Toasts") + Retranslate.onLanguageChanged
        imageSource: "asset:///images/toast.png"
        delegate: Delegate {
            Toasts {
            }
        }
    }
    Tab {
        title: qsTr("Spinners") + Retranslate.onLanguageChanged
        imageSource: "asset:///images/spinner.png"
        delegate: Delegate {
            Spinners {
            }
        }

    }
}
