/**
 * This source file contains JSX syntax
 * It requires babel syntax highlighting
 */

export const dialogInfo = <info>Hello world!</info>;

export const dialogAlert = (
    <alert caption="Alert">
        <p>Don't worry!</p>
        <p>It is just a demo</p>
    </alert>
);

export const dialogError = (
    <error>
        <p>Don't worry!</p>
        <p>It is just a demo</p>
    </error>
);

export const dialogQuestion = (
    <question>
        <content>Be or not to be?</content>
        <buttons>
            <button #yes role="default-button">Yes</button>
            <button #no role="cancel-button">No</button>
            <button #cancel role="cancel-button">Cancel</button>
        </buttons>
    </question>
);
