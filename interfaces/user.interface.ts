
export interface User {

    username: string;
    fullname: string;
    email: string;
    birthday_date: Date;    
    faculty: string;
    cycle: Int16Array;
    dni: Int16Array;
    password: string;
}

export interface IUpdateProfile {
    user?: string;
    description?: string;
    fullname?: string;
    phone?: string;
    cycle?: Int16Array;
}

export interface IChangePassword {
    currentPassword: string;
    newPassword: string
}

export interface INewFriend {
    uidFriend: string
}

export interface IAcceptFollowerRequest {
    uidFriend: string,
    uidNotification: string
}