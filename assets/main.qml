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
import bb.cascades 1.3
import Network.RequestHeaders 1.0
import my.library 1.0

TabbedPane {
    id: nav
    
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
        Page {
            id: stampListPage
            
            Container {
                // A paper-style image is used to tile the background.
                background: backgroundPaint.imagePaint
                
                attachedObjects: [
                    ImagePaintDefinition {
                        id: backgroundPaint
                        imageSource: "asset:///images/Scribble_light_256x256.amd"
                        repeatPattern: RepeatPattern.XY
                    }
                ]
                
                // Main List
                ListView {
                    id: roomList
                    objectName: "roomList"
                    layout: GridListLayout {
                        columnCount: 2
                        headerMode: ListHeaderMode.Sticky
                        cellAspectRatio: 4
                    }
                    
                    // This data model will be replaced by a JSON model when the application starts,
                    // an XML model can be used to prototype the UI and for smaller static lists.
                    dataModel: XmlDataModel {
                        source: "models/rooms.xml"
                    }
                    
                    leadingVisual: RefreshHeader {
                        id: refreshHeader
                        horizontalAlignment: HorizontalAlignment.Center
                        asynchronous: true
                        onTriggerRefresh: {
                            app.refreshDone.connect(roomList.refreshDone());
                            app.refresh();
                        }
                    }
                    leadingVisualSnapThreshold: 2.0
                    onTouch: {
                        refreshHeader.onListViewTouch(event);
                    }
                    function refreshDone() {
                        refreshHeader.refreshDone();
                    }
                    
                    listItemComponents: [
                        ListItemComponent {
                            type: "header"
                            
                            Header {
                                title: {
                                    if (ListItemData.title) {
                                        // If the data is loaded from XML, a title property is used for the title.
                                        ListItemData.title
                                    } else {
                                        // If it is loaded from JSON and set in a GroupDataModel, the header info is set in ListItemData.
                                        ListItemData
                                    }
                                }
                            }
                        },
                        // The stamp Item
                        ListItemComponent {
                            type: "item"
                            StampItem {
                            }
                        }
                    ] // listItemComponents
                    
                    /*onTriggered: {
                        
                        // To avoid triggering navigation when pressing the header items, we check so that the  
                        // index path length is larger then one (one entry would be a group under a header item).
                        if(indexPath.length > 1) {
                            // When an item is selected we push the recipe Page in the chosenItem file attribute.
                            var chosenItem = dataModel.data(indexPath);
                            
                            // Create the content page and push it on top to drill down to it.
                            var contentpage = contentPageDefinition.createObject();
                            
                            // Set the content properties to reflect the selected image.
                            contentpage.contentImageURL = chosenItem.URL
                            contentpage.contentDescription = chosenItem.infoText
                            
                            // Push the content page to the navigation stack
                            //NOTE: Cannot push onto a TabbedPane
                            //nav.push(contentpage);
                        }
                    }*/                
                }
            }// Container
        }// StampPage
        
        attachedObjects: [
            
            // This is the definition of the Content page used to create a page in the onTriggered signal-handler above. 
            ComponentDefinition {
                id: contentPageDefinition
                source: "ContentPage.qml"
            }
        ]
        
        /*onPopTransitionEnded: {
            // Transition is done destroy the Page to free up memory.
            page.destroy();
        }*/
    }
}
