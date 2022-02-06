import nodemailer from 'nodemailer';

export const sendEmailVerify = async (subject: string, to: string, html: string) => {

    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth:{
            user: '',
            pass: ''
        },
        tls: {
            rejectUnauthorized: false
        }
    });


    const mailOptions = {
        from: '',
        to: to,
        subject: subject,
        html: html,
    };

    await transporter.sendMail( mailOptions );

} 